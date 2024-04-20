# swift-format-executable

[![Check](https://github.com/DevYeom/swift-format-executable/actions/workflows/check.yml/badge.svg)](https://github.com/DevYeom/swift-format-executable/actions/workflows/check.yml)

The `swift-format-executable` repository provides a pre-built executable binary for [apple/swift-format](https://github.com/apple/swift-format) tool. This repository allows you to easily download and use `swift-format` in your CI/CD environments without the need to build it every time.

## Usage

### Download

To download the latest version of the `swift-format` binary, run the following command:

```
curl -LO https://github.com/DevYeom/swift-format-executable/releases/latest/download/swift-format.zip
```

To download a specific version of the `swift-format` binary, specify the version in the URL:

```
curl -LO https://github.com/DevYeom/swift-format-executable/releases/download/510.1.0/swift-format.zip
```

If you're running in `x86_64` environment, you can use the following URL.

```
curl -LO https://github.com/DevYeom/swift-format-executable/releases/download/510.1.0/swift-format-x86_64.zip
```

### Grant Execution Permission

After downloading, give execution permission to the binary:

```
chmod +x swift-format
```

### Run

Now, you can use swift-format:

```
./swift-format --version
```
