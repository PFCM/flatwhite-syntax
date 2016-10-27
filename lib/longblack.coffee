fs = require 'fs'
path = require 'path'
{CompositeDisposable} = require 'atom'

class Longblack

  config: require('./longblack-settings').config

  activate: ->

    @disposables = new CompositeDisposable
    @packageName = require('../package.json').name
    @disposables.add atom.config.observe "#{@packageName}.embedded", => @enableConfigTheme()

  deactivate: ->
    @disposables.dispose()

  enableConfigTheme: ->
    ebmedded = atom.config.get "#{@packageName}.embedded"
    @enableTheme ebmedded

  enableTheme: (embedded) ->
    embedded_path = "#{__dirname}/../styles/settings.less"
    fs.writeFileSync embedded_path, "@import 'languages/embedded-#{@getNormalizedName(embedded)}';"
    atom.packages.getLoadedPackage("#{@packageName}").reloadStylesheets()

  getNormalizedName: (name) ->
    "#{name}"
      .replace /\ /g, '-'
      .toLowerCase()

module.exports = new Longblack
