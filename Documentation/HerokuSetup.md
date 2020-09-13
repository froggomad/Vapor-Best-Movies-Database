# Heroku Deployment

## Follow [Vapor Deployment Docs](https://docs.vapor.codes/4.0/deploy/heroku/) through committing build files
- I pushed at this point and got an error: `missing LinuxMain.swift in the tests directory.`
  - run command `swift test —-enable-test-discovery` in terminal
  - I also had to run `swift test --generate-linuxmain`
    - if you have already tried to push, you need to run `heroku buildpacks:clear` then
      - `heroku buildpacks:set vapor/vapor`
      - Rollback app to v1 on heroku.com!
  
- Continue with [Vapor Deployment Docs](https://docs.vapor.codes/4.0/deploy/heroku/)
