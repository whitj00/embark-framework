module.exports = (grunt) ->
  express = require("express")
  compression = require("compression")
  readYaml = require('read-yaml');

  serverConfig = readYaml.sync("config/server.yml")

  grunt.registerTask "server", "static file development server", =>
    webPort = serverConfig.port || 8000
    webHost = serverConfig.host || 'localhost'
    webRoot = "generated/dapp"

    app = express()
    app.use(compression())
    app.use(express.static("" + (process.cwd()) + "/" + webRoot))
    app.listen(webPort, webHost)

    grunt.log.writeln("Running web server on port http://#{webHost}:#{webPort}")

    return app

