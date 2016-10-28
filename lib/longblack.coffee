fs = require 'fs'
path = require 'path'
{CompositeDisposable} = require 'atom'

class Longblack

  config: require('./longblack-settings').config

  activate: ->

    @disposables = new CompositeDisposable
    @packageName = require('../package.json').name
    @disposables.add atom.config.observe "#{@packageName}.mode", => @enableConfigTheme()

  deactivate: ->
    @disposables.dispose()

  enableConfigTheme: ->
    mode = atom.config.get "#{@packageName}.mode"
    @enableTheme mode

  enableTheme: (mode) ->
    embedded_path = "#{__dirname}/../styles/settings.less"
    old_settings = fs.readFileSync embedded_path
    settings = ""

    # flip a couple of syntax variables
    if mode == "dark"
      settings += "@syntax-text-color: @base6;\n"
      settings += "@syntax-background-color: @base1;\n"
    else if mode == "light"
      settings += "@syntax-text-color: @base0;\n"
      settings += "@syntax-background-color: @base6;\n"

    fs.writeFileSync embedded_path, settings

    atom.packages.getLoadedPackage("#{@packageName}").reloadStylesheets()
    # also reload the UI package
    all_packages = atom.packages.getActivePackages()
    for p in all_packages
      if p.name.slice(-2) == 'ui'
        console.log(p)
        p.reloadStylesheets()

  getNormalizedName: (name) ->
    "#{name}"
      .replace /\ /g, '-'
      .toLowerCase()

module.exports = new Longblack
