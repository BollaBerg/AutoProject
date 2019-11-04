import sys
import getpass
from github import Github

username = 'bollaberg' # Add username here

def create():
    projectName = str(sys.argv[1])

    print("Username: " + username)
    password = getpass.getpass() # This line can be changed for a simple "password = 'PASSWORD'" if you'd like

    user = Github(username, password).get_user()
    repo = user.create_repo(projectName)
    print(F"Successfully created repository named {projectName}")

if __name__ == "__main__":
    create()