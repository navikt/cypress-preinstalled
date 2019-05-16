# cypress-preinstalled
To be able to use cypress inside our secure zones.

For some reason we can't get an official image that have cypress pre-installed.

https://github.com/cypress-io/cypress-docker-images/tree/master/base/10

## using the image
The image have cypress as entrypoint, which means that from the root of a project you can run something
like this:
```bash
docker run -v $(pwd):/workdir navikt/cypress-preinstalled run --project ./workdir
```
...to run your tests.

With not much testing you probably need to also give the docker-process access to "localhost" if you
are running tests against that environment. On linux docker hosts this is easy `--net=host` gives the
docker process access to local host.

But on osx you would probably have to do some more work to get that working.

## With docker-compose
Have to be tested.
