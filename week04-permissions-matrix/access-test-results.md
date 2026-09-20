# Access Test Results

## HR-Staff Test Account

Test account: `hr-staff-test`

The test account was added to the HR-Staff group and used to test access to the Payroll share.

## Test Results

### Test 1 - Create a File
**Result: ALLOWED**

The HR-Staff test account was able to create `HR-Staff-Test.txt` in the CurrentYear folder.

### Test 2 - Edit and Save the File
**Result: ALLOWED**

The HR-Staff test account was able to open, edit, and save `HR-Staff-Test.txt`.

### Test 3 - Delete an Administrator-Created File
**Result: ALLOWED**

The HR-Staff test account was able to delete `Admin-Test.txt`, which had been created by the Administrator account.

### Test 4 - Change Payroll Permissions
**Result: BLOCKED**

The HR-Staff test account could view the Payroll folder security information, but Windows required credentials from an account with additional permissions when attempting to make a security change.

## Permissions Matrix

| Group Name | NTFS Permission | Share Permission | Effective Network Access | Test Result |
|---|---|---|---|---|
| HR-Managers | Full Control | Full | Full Control | Configured |
| HR-Staff | Modify | Change | Modify | Tested - Allowed |
| Audit-Readonly | Read & Execute | Read | Read | Configured |

## Least-Privilege Rationale

Each group was given only the permissions needed for its role. HR-Managers received Full Control, HR-Staff received Modify access so they can work with files without managing permissions, and Audit-Readonly received Read access so files can be reviewed without being changed.

## Summary

The access tests showed that the HR-Staff account could perform normal file operations through its Modify and Change access. It could create, edit, and delete files, but it could not make security changes without providing credentials for an account with additional permissions.