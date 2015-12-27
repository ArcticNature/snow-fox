SnowFox
=======
Main SnowFox repository.

SnowFox is being drastically re-organised to split components into
different repositories and replace some incorrect architecture decisions.

The [ArcticNature](https://github.com/ArcticNature) organization will be
the new home of the project.


Documentation
-------------
Documentation needs to be moved to the new organization and updated
to reflect the changes introduced by this redesign.

For the time being you can visit the [old documentation](http://stefano-pogliani.github.io/snow-fox-pages/).


Contributions
-------------
Contributions are more then welcome!!!
At this stage there is very little you can do but if you want to get started
this is what you need to know:

### Split repo
This repository is a superproject for all components that are part of the
official distribution.
Clone it with `git clone git@github.com:ArcticNature/snow-fox.git --recursive`

### Building without commit
The submodule approach makes it very easy to keep separate the components
and allows them to eveolve independently.
It also makes it very easy to create custom versions of SnowFox by picking
the set of submodules to include.

This repository is the place to build SnowFox from.
*Individual repositories cannot be built*.
To work around the problem of changes to submodules that need to be pushed
to origin and then pulled in the superproject we can use symlinks.

Given the following directory structure, the `make-dev-dir` script sets
up everything you need to `grunt *` the project.

    arctic-nature/
      build-tools -> git repo for submodule.
      core -> git repo for submodule.
      ...
      snow-fox -> this git repository.

From the organization directory run:

    snow-fox/make-dev-dir snow-for-dev
