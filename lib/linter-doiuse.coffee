linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"

class LinterDoiuse extends Linter
    @syntax: ['source.css']
    linterName: ['doiuse']

    cmd: 'doiuse'
    executablePath: undefined

    # test.css:2:1: Flexible Box Layout Module not supported by: IE (8,9,10)
    regex: '.+:(?<line>\\d+):(?<col>\\d+):\\s(?<message>.*)'

    constructor: (editor) ->
        super(editor)

        atom.config.observe 'linter-doiuse.doiuseBrowsers', =>
            @browsers = atom.config.get 'linter-doiuse.doiuseBrowsers'
            @_updateCmd()

        atom.config.observe 'linter-doiuse.doiuseExecutablePath', =>
            @executablePath = atom.config.get 'linter-doiuse.doiuseExecutablePath'

    destroy: ->
        atom.config.unobserve 'linter-doiuse.doiuseBrowsers'
        atom.config.unobserve 'linter-doiuse.doiuseExecutablePath'

    _updateCmd: ->
        @cmd = ["doiuse", "--browsers '#{@browsers}'"];

module.exports = LinterDoiuse
