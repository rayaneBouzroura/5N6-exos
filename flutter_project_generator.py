import os
import subprocess
import sys
import tkinter as tk
from tkinter import filedialog, messagebox

def run_command(command):
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    output, error = process.communicate()
    if process.returncode != 0:
        print(f"Error: {error.decode('utf-8')}")
        sys.exit(1)
    return output.decode('utf-8')

def create_flutter_project(project_name, directory):
    print(f"Creating Flutter project: {project_name} in {directory}")
    os.chdir(directory)
    run_command(f"flutter create {project_name}")
    os.chdir(project_name)

def add_sidebar_to_main(project_name, pages):
    main_content = f"""
import 'package:flutter/material.dart';
{'; '.join([f"import '{page.lower()}_page.dart'" for page in pages])}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {{
  @override
  Widget build(BuildContext context) {{
    return MaterialApp(
      title: '{project_name}',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }}
}}

class HomePage extends StatefulWidget {{
  @override
  _HomePageState createState() => _HomePageState();
}}

class _HomePageState extends State<HomePage> {{
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    {', '.join([f"{page}Page()" for page in pages])}
  ];

  @override
  Widget build(BuildContext context) {{
    return Scaffold(
      appBar: AppBar(title: Text('{project_name}')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            {', '.join([f"""
            ListTile(
              title: Text('{page}'),
              onTap: () {{
                setState(() {{ _selectedIndex = {i}; }});
                Navigator.pop(context);
              }},
            )""" for i, page in enumerate(pages)])}
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }}
}}
"""
    with open('lib/main.dart', 'w') as f:
        f.write(main_content)

def create_page(page_name):
    page_content = f"""
import 'package:flutter/material.dart';

class {page_name}Page extends StatelessWidget {{
  @override
  Widget build(BuildContext context) {{
    return Center(child: Text('{page_name} Page'));
  }}
}}
"""
    with open(f'lib/{page_name.lower()}_page.dart', 'w') as f:
        f.write(page_content)

def choose_directory():
    root = tk.Tk()
    root.withdraw()
    directory = filedialog.askdirectory(title="Choose directory for Flutter project")
    return directory

def validate_project_name(name):
    if not name:
        return False
    if not name.replace('_', '').isalnum():
        return False
    if name[0].isdigit():
        return False
    return True

def get_valid_input(prompt, validator, error_message):
    while True:
        user_input = input(prompt)
        if validator(user_input):
            return user_input
        print(error_message)

def main():
    print("Welcome to the Flutter Project Creator!")

    project_name = get_valid_input(
        "Enter the project name: ",
        validate_project_name,
        "Invalid project name. Please use only letters, numbers, and underscores, and start with a letter."
    )

    print("\nWhere would you like to create the project?")
    print("1. Current directory")
    print("2. Choose another directory")
    
    choice = get_valid_input(
        "Enter your choice (1 or 2): ",
        lambda x: x in ['1', '2'],
        "Invalid choice. Please enter 1 or 2."
    )

    if choice == '1':
        directory = os.getcwd()
    else:
        print("Please choose the directory where you want to create the Flutter project.")
        directory = choose_directory()
        if not directory:
            print("No directory selected. Exiting.")
            return

    create_flutter_project(project_name, directory)

    num_pages = get_valid_input(
        "How many pages do you want? ",
        lambda x: x.isdigit() and 1 <= int(x) <= 10,
        "Please enter a valid number between 1 and 10."
    )
    num_pages = int(num_pages)

    pages = []
    for i in range(num_pages):
        page_name = get_valid_input(
            f"Enter the name for page {i+1}: ",
            lambda x: x.isalpha() and len(x) > 0,
            "Invalid page name. Please use only letters."
        )
        pages.append(page_name.capitalize())
        create_page(page_name.capitalize())

    add_sidebar_to_main(project_name, pages)

    print(f"\nProject '{project_name}' created successfully!")
    print(f"Location: {os.path.join(directory, project_name)}")
    print(f"Number of pages: {num_pages}")
    print("Pages created: " + ", ".join(pages))
    print("\nYou can now open this project in your preferred Flutter development environment.")

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\nOperation cancelled by user. Exiting.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        print("Please try again or report this issue.")