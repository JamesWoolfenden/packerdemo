# Packer intoduction

## Speed

Builds, environments whatever, we should always be trying to do it faster so that we can do more, interact more. An image is launched as quickly as possible. If it’s part of a scaling group, this is even more critical.

## Cross Platform

It can make any platform on any platform.

## Infrastructure as code

Transparent process auditable process.

## CI for Infrastructure

When combined in a CI environment you know what was added and how and by whom.

## Portability

Currently under-utilized but you can use the same methods to create images for Azure, VMware, Vagrant and Docker.

## Reuse-Stability

Repeated use of the image creation process leads to refinement and reduced fragility. The process works. You want the latest patches applied? Apt-get repos fail, Nuget repos fail, download link break, so pre-built images can be critical.

## Repeatability, testability

After a machine image is built, that machine image can be quickly launched and smoke tested to verify that things appear to be working. If they are, you can be confident that any other machines launched from that image will function properly.
