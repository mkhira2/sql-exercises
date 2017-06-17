-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store

-- List all the scientists' names, their projects' names, and the hours worked by that scientist on each project, in alphabetical order of project name, then scientist name.
SELECT scientists.name, projects.name, projects.hours FROM scientists INNER JOIN assignedto ON scientists.ssn = assignedto.scientist INNER JOIN projects ON assignedto.project = projects.code ORDER BY projects.name ASC, scientists.name ASC;
