grunt-angular-bootstrap
=======================

Bootstrap files for quick asset management in grunt for angular js

##Usage

1. Fill in package.json with a valid name for the component you're building
2. Run `grunt` as commandline command inside the folder with `gruntfile.coffee`
3. Create the `src/coffee` and `src/less` directories and start filling them

###Coffee
The script should start compiling all your coffee script angular files in 2 js files, named `{pkg.name}.definitions.min.js` and `{pkg.name}.modules.min.js`.
The prior containing the module definitions, required to add controllers, directives, services, etc. to the module. The latter will add the module contents.

Include the files in the following order in your layouts:
```
<script src='build/js/{pkg.name}.definitions.min.js'></script>
<script src='build/js/{pkg.name}.modules.min.js'></script>
```

