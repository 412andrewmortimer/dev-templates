# Nix flake templates for easy dev environments

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

To initialize (where `${ENV}` is listed in the table below):

```shell
nix flake init --template github:the-nix-way/dev-templates#${ENV}
```

Here's an example (for the [`rust`](./rust) template):

```shell
# Initialize in the current project
nix flake init --template github:the-nix-way/dev-templates#rust

# Create a new project
nix flake new --template github:the-nix-way/dev-templates#rust ${NEW_PROJECT_DIRECTORY}
```

## How to use the templates

Once your preferred template has been initialized, you can use the provided shell in two ways:

1. If you have [`nix-direnv`][nix-direnv] installed, you can initialize the environment by running `direnv allow`.
2. If you don't have `nix-direnv` installed, you can run `nix develop` to open up the Nix-defined shell.

## Available templates

| Language/framework/tool | Template                  |
| :---------------------- | :------------------------ |
| [Dhall]                 | [`dhall`](./dhall/)       |
| [Elixir]                | [`elixir`](./elixir/)     |
| [Gleam]                 | [`gleam`](./gleam/)       |
| [Go] 1.17               | [`go1_17`](./go1.17/)     |
| [Go] 1.18               | [`go1_18`](./go1.18/)     |
| [Hashicorp] tools       | [`hashi`](./hashi/)       |
| [Java]                  | [`java`](./java/)         |
| [Kotlin]                | [`kotlin`](./kotlin/)     |
| [Nix]                   | [`nix`](./nix/)           |
| [Node.js][node]         | [`node`](./node/)         |
| [Protobuf]              | [`protobuf`](./protobuf/) |
| [Rust]                  | [`rust`](./rust/)         |
| [Scala]                 | [`scala`](./scala/)       |
| [Zig]                   | [`zig`](./zig/)           |

## Template contents

The sections below list what each template includes. In all cases, you're free to add and remove packages as you see fit; the templates are just boilerplate.

### [`cue`](./cue/)

- [Cue] 0.4.3
- [nix-cue]

### [`dhall`](./dhall)

- [Dhall] 1.40.2
- [`dhall-bash`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-bash)
- [`dhall-csv`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-csv) (Linux only)
- [`dhall-docs`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-docs)
- [`dhall-json`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-json)
- [`dhall-lsp-server`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-lsp-server)
- [`dhall-nix`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-nix)
- [`dhall-nixpkgs`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-nixpkgs)
- [`dhall-openapi`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-openapi)
- [`dhall-text`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-text) (Linux only)
- [`dhall-toml`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-toml)
- [`dhall-yaml`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-yaml)

### [`elixir`](./elixir/)

- [Elixir] 1.13.4, including [mix] and [IEx]
- [Node.js][node] 18.7.0 (largely for [Phoenix] projects)

### [`gleam`](./gleam/)

- [Gleam] 0.22.1

### [`go1.17`](./go1.17/)

- [Go] 1.17
- Standard Go tools ([goimports], [godoc], and others)
- [golangci-lint]

### [`go1.18`](./go1.18/)

- [Go] 1.18
- Standard Go tools ([goimports], [godoc], and others)
- [golangci-lint]

### [`hashi`](./hashi/)

- [Terraform] 1.2.6
- [Packer] 1.8.2
- [Nomad] 1.2.9
- [nomad-autoscaler] 0.3.6-dev
- [nomad-pack] 0.0.1-techpreview.3
- [levant] 0.3.1
- [damon]
- [Terragrunt] 0.37.0

### [`java`](./java)

- [Java] 17.0.3
- [Maven] 3.8.5
- [Gradle] 7.5
- [Ant] 1.10.11

### [`kotlin`](./kotlin/)

- [Kotlin] 1.7.10-release-333
- [Gradle] 7.5

### [`nim`](./nim)

- [Nim] 1.6.6
- [nimble] 0.13.1

### [`nix`](./nix/)

- [Cachix]
- [dhall-to-nix] 1.1.23
- [lorri]
- [niv]
- [nixfmt]
- [statix]
- [vulnix]

### [`node`](./node/)

- [Node.js][node] 18.7.0
- [pnpm] 7.3.0
- [Yarn] 1.22.19

### [`protobuf`](./protobuf/)

- The [Buf CLI][buf] 1.7.0
- [protoc][protobuf] 3.19.4

### [`rust`](./rust/)

- [Rust], including [cargo], [Clippy], and the other standard tools. The Rust version is determined as follows, in order:

  - From the `rust-toolchain.toml` file if present
  - From the `rust-toolchain` file if present
  - Version 1.6.2 if neither is present

- [rust-analyzer] 2022-07-11

### [`scala`](./scala/)

- [Scala] 3.1.0 ([Java] 17.0.3)
- [sbt] 1.6.2

### [`zig`](./zig/)

- [Zig] 0.9.1

## Code organization

All of the templates have only the root [flake](./flake.nix) as a flake input. That root flake provides a common revision of [Nixpkgs] and [`flake-utils`][flake-utils] to all the templates.

[ant]: https://ant.apache.org
[buf]: https://github.com/bufbuild/buf
[cachix]: https://www.cachix.org
[cargo]: https://doc.rust-lang.org/cargo
[clippy]: https://github.com/rust-lang/rust-clippy
[cue]: https://cuelang.org
[damon]: https://github.com/hashicorp/damon
[dhall]: https://dhall-lang.org
[dhall-to-nix]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-nix
[elixir]: https://elixir-lang.org
[flake-utils]: https://github.com/numtide/flake-utils
[gleam]: https://gleam.run
[go]: https://go.dev
[godoc]: https://pkg.go.dev/golang.org/x/tools/cmd/godoc
[goimports]: https://pkg.go.dev/golang.org/x/tools/cmd/goimports
[golangci-lint]: https://github.com/golangci/golangci-lint
[gradle]: https://gradle.org
[hashicorp]: https://hashicorp.com/
[iex]: https://hexdocs.pm/iex/IEx.html
[java]: https://java.com
[kotlin]: https://kotlinlang.org
[levant]: https://github.com/hashicorp/levant
[lorri]: https://github.com/target/lorri
[maven]: https://maven.apache.org
[mix]: https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html
[nim]: https://nim-lang.org
[nimble]: https://github.com/nim-lang/nimble
[niv]: https://github.com/nmattia/niv
[nix]: https://nixos.org
[nix-cue]: https://github.com/jmgilman/nix-cue
[nixfmt]: https://github.com/serokell/nixfmt
[nixpkgs]: https://github.com/NixOS/nixpkgs
[nix-direnv]: https://github.com/nix-community/nix-direnv
[node]: https://nodejs.org
[nomad]: https://nomadproject.io
[nomad-autoscaler]: TOhttps://github.com/hashicorp/nomad-autoscaler
[nomad-pack]: https://github.com/hashicorp/nomad-pack
[packer]: https://packer.io
[phoenix]: https://phoenixframework.org
[pnpm]: https://pnpm.io
[protobuf]: https://developers.google.com/protocol-buffers
[rust]: https://rust-lang.org
[scala]: https://scala-lang.org
[statix]: https://github.com/nerdypepper/statix
[sbt]: https://www.scala-sbt.org
[terraform]: https://terraform.io
[terragrunt]: https://terragrunt.gruntwork.io
[vulnix]: https://github.com/flyingcircusio/vulnix
[yarn]: https://yarnpkg.com
[zig]: https://ziglang.org
