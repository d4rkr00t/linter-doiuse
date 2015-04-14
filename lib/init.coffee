path = require 'path'

module.exports =
    configDefaults:
        doiuseExecutablePath: path.join __dirname, '..', 'node_modules', '.bin'
        doiuseBrowsers: 'ie >= 9, > 1%, last 2 versions'

    activate: ->
        console.log 'activate linter-doiuse'
