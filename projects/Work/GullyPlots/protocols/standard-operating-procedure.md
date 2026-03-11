# Standard Operating Procedure (SOP)

This protocol ensures that all AI-driven code modifications follow a strict safety and quality check.

## 1. Pre-Flight Check
Prior to executing any `write_to_file` or `replace_file_content` tool:
- **Locate Permissions**: Read `c:\Proj\ai-governance\projects\[CATEGORY]\[PROJECT_NAME]\permissions.md`.
- **Identify Risk**: Determine if the target file is in a Restricted or Manual zone.

## 2. Handling Restricted Files (🟡 MANUAL)
If a file is marked as Manual:
1. **Pause**: Do not invoke the edit tool.
2. **Scan**: Check `c:\Proj\ai-governance\projects\[CATEGORY]\[PROJECT_NAME]\manual_instructions/` for a `.txt` or `.md` file matching the task.
3. **Request**: If no instructions exist, notify the user: 
   *"I am attempting to edit a MANUAL access file. Please provide a step-by-step walkthrough or approve the drafted plan."*

## 3. The "Emergency Brake"
- If the Agent encounters `// AGENT: STOP` or `[AGENT: STOP]` anywhere in the code, it must treat the entire file as **🔴 PROTECTED** regardless of what the permissions file says.

## 4. Documentation
- Every modification to a **🟡 MANUAL** file must be logged in a task artifact or the chat with a "Change Reason" and "Instruction Reference."
