# planradar-assessment

# How to Run the app
The app is build in a Docker VsCode-devcontainer. So you have to install Docker and VsCode.

- Install Docker and VsCode
- Open in VsCode the planradar-assessment folder
- Add the Docker and the Dev Containers extention to VsCode
- Press F1 and build the image with the Dockerfile
- With the Green button in the bottom right corner you can start the container
- Run in the VsCode terminal ``rails db:create db:migrate db:seed`` and ``rails db:migrate RAILS_ENV=test``

# How the app works
After someone creates a new Ticket, the set_user_notification callback gets triggert.
In there a guard checks if the user want notifications.
If so, it enqueued the UserTicketNotificationJob for the user set notification date and time.

# Rspec
How to run the tests:
  - open the terminal in the from the vs-code in the devcontainer
  - run ``bundle exec rspec``
