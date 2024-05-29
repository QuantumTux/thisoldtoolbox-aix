# thisoldtoolbox-aix
This repo is part of my **This Old Toolbox** set of repos, which collectively host various system administration/management tools I've written over the years, [for a variety of platforms and environments](https://github.com/QuantumTux/Effluvia/wiki/Why-I-Love-Python,-But-I-Still-Write-Tools-in-BASH). I'm making them public so that others might find the ideas and/or the accumulated knowledge helpful to whatever they need to create.

# Documentation
These tools have extensive in-line documentation in the form of comments.

# Code Style
All over the place, really. Even in Korn shell, I try to follow the [Google BASH Style Guide](https://google.github.io/styleguide/shellguide.html). However, [I value thorough and well-written comments](https://github.com/QuantumTux/Effluvia/wiki/What-is-it-About-Documentation%3F#comments-are-code-for-humans) above following a specific code style.

# Warranty
Absolutely none at all. I stand by my work, yes, but I wrote these things for the environment in which I operated at the time. It probably isn't the same as any other environment. If someone tries to use any of my tools without taking the time to examine and understand the code, they're asking for trouble.

# The Library
These tools are written in Korn shell, specifically **ksh93**, and rely upon a KSH library that is part of this repo. It might seem to be a little overkill, but there's history behind it.

<details>

<summary>Why I Created a KSH Library</summary>

  I started developing these particular tools in a mixed AIX 7 and SLES v15 environment. My original intention was to have a single library that worked for both BASH (SLES) and AIX. I wanted to write tools that worked in both places, using a library to insulate me from the differences between the platforms.

  The tools in this repo were all written for AIX v7. I didn't want to re-factor everything when I published them here, so I kept the library.
</details>

The library should be placed in **/usr/local/lib/aix_tools.ksh**

# The Tools

## aixdiskreport

This tool is designed to gather and distill the storage configuration on an AIX LPAR.

<details>
<summary>Read more about aixdiskreport</summary>
  
Coming from the Linux world, I found the AIX approach to logical volume mangement fairly understandable. I didn't like how difficult it was to figure out storage units, and I think hard-coded names like **rootvg** are silly, but I still understood it. This tool is based off of a similar tool I wrote for the Linux environment.

Only storage devices managed as Physical Volumes are detected and reported by this tool.

</details>

## aixnetreport

Based on my **ethreport** tool from Linux, this tool tries to do something similar in AIX.

<details>
<summary>Read more about aixnetreport</summary>
  
  While I could figure out storage in the AIX world, I found the networking component of AIX obtuse and needlessly complex. I don't understand the reason behind **ent** *vs* **en** devices.

  I also found it astonishing that AIX didn't support detecting Link State until AIX 7.1.3.3, and it still required setting a specific attribute on the LPAR interface.

</details>

## aixopenf

AIX didn't seem to have equivalent of the **lsof** tool in Linux.

<details>
<summary>Read more about aixopenf</summary>

  The purpose of this tool is to gather and display, for each Logical Volume, the running processes that have open files.

</details>

## aixpsnet

Another Linux tool missing from AIX is **netstat**.

<details>
<summary>Read more about aixpsnet</summary>

  The purpose of this tool is to gather and display, for each TCP/IP port which is bound, the process or AIX Kernel Extension binding to the port; this is somewhat similar to Linux "netstat -anp".

</details>
