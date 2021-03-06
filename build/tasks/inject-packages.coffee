path = require 'path'
fs = require 'fs-extra'
workDir = null

module.exports = (grunt) ->
  {injectPackage, injectDependency} = require('./task-helpers')(grunt)

  grunt.registerTask 'inject-packages', 'Inject packages into packages.json and node_modules dir', ->
    workDir = grunt.config.get 'particleDevApp.workDir'

    injectPackage 'file-type-icons', '1.3.4'
    injectPackage 'switch-header-source', '0.27.1'
    injectPackage 'resize-panes', '0.2.0'
    injectPackage 'maximize-panes', '0.2.0'
    injectPackage 'swap-panes', '0.2.0'
    injectPackage 'tool-bar', '1.1.3'
    injectPackage 'monokai', '0.24.0'
    injectPackage 'console-panel', '0.3.0'

    if grunt.config.get 'particleDevApp.isRelease'
      injectPackage 'particle-dev', grunt.config.get('particleDevApp.particleDevVersion')

    injectPackage 'language-particle', '0.3.5'
    injectPackage 'particle-dev-exception-reporting', '0.36.1'
    injectPackage 'particle-dev-cloud-functions', '0.2.0'
    injectPackage 'particle-dev-cloud-variables', '0.2.0'
    injectPackage 'particle-dev-profiles', '0.2.3'
    injectPackage 'particle-dev-libraries', '0.2.29'
    injectPackage 'clear-blob-storage', '0.1.3'

    injectPackage 'autocomplete-plus', '2.35.6'

    # Following packages are required by Atom source code:
    # injectPackage 'welcome'
    # injectPackage 'metrics'
    # injectPackage 'deprecation-cop'

    injectDependency 'coffeestack', 'git+https://github.com/particle-iot/coffeestack.git#master'
