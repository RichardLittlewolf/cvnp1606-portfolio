\# Troubleshooting Narrative



\## Why can a user open a file but not edit it?



If a user can open a file but cannot edit it, I would first check both the share permissions and the NTFS permissions. Just because a user has permission to access the shared folder does not mean they automatically have permission to change the files inside of it.



Share permissions control what the user can do when accessing the folder over the network. NTFS permissions control what the user can do with the actual files and folders. When a user accesses a shared folder over the network, both sets of permissions apply.



For example, if a user has Read permission on the share but Modify permission through NTFS, they would still be limited by the Read permission on the share. The opposite can also happen. A user could have Change permission on the share but only Read \& Execute through NTFS, which would still prevent them from editing the file.



I would check the user's group memberships and compare the share permissions with the NTFS permissions. I would also check for inherited permissions or other group memberships that could affect the user's access. The goal would be to find which permission is limiting the user before making any changes.

