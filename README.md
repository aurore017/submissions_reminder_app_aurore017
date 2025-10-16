## 🧾 README – Submission Reminder Automation

This project is a **Bash-based automation tool** that helps track and remind students about pending assignment submissions. It includes two main scripts that work together seamlessly. The first script, **`create_environment.sh`**, prompts for your name and automatically builds a complete environment called `submission_remainder_{yourName}`. Inside, it creates organized folders (`app`, `modules`, `assets`, and `config`) and generates ready-to-run files such as `config.env`, `functions.sh`, and `startup.sh`. The second script, **`run_reminder.sh`**, allows you to choose different assignments (e.g., *Shell Navigation*, *Shell Basics*, *Git*), updates the configuration automatically, and runs reminders via the startup script. The reminder system reads from `assets/submissions.txt` and lists students who haven’t submitted the selected assignment.

**Usage:**

1. Run `bash create_environment.sh` and follow the prompt to set up your environment.
2. Then execute `bash run_reminder.sh` to check and manage submissions interactively.

This project provides a quick, organized, and reusable way for instructors or team leads to monitor submission progress and send timely reminders.

