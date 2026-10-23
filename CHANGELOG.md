## 1.0.0 (2026-10-23)

### What's New

- add support for TypeScript 7

## 0.3.0 (2026-03-23)

### Breaking Changes

- map default paths (`@apst/tsconfig`, `@apst/tsconfig/lib`) to TypeScript 6 configuration

### TypeScript 5 Support

For TypeScript 5 support, please update the configuration:

```diff
{
-   "extends": "@apst/tsconfig"
+   "extends": "@apst/tsconfig/5"
}
```

Or for a library:

```diff
{
-   "extends": "@apst/tsconfig/lib"
+   "extends": "@apst/tsconfig/5/lib"
}
```

## 0.2.1 (2026-03-18)

### Breaking Changes

- switch target to `esnext` in `tsconfig.lib.json`

### What's New

- add support for TypeScript 6

### What's Changed

- update package metadata

## 0.1.3 (2025-05-28)

### What's Changed

- update `package.json`

## 0.1.2 (2025-05-28)

### What's Changed

- update `package.json`

## 0.1.1 (2025-05-27)

### What's Changed

- update `package.json`

## 0.1.0 (2024-11-17)

initial release
