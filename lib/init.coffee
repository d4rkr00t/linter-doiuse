path = require 'path'

module.exports =
    config:
        doiuseExecutablePath:
            type: 'string'
            default: path.join __dirname, '..', 'node_modules', '.bin'
        doiuseBrowsers:
            type: 'string'
            default: 'ie >= 9, > 1%, last 2 versions'

    activate: ->
        console.log 'activate linter-doiuse'
