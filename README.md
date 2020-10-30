![GitHub Workflow Status](https://img.shields.io/github/workflow/status/kimseongrim/blog/generate-and-deploy)

### Generate Blog

```bash
hexo clean
hexo generate
hexo server
```

### Typora setting

1. Install [typora-theme-next](https://github.com/BillChen2K/typora-theme-next)
2. Setting > Image
  * Copy image to custom folder > ./images
  * Select Apply above rols to local images
  * Select Apply above rols to online images
  * Use relative path if possible

### Publish article

```bash
$ chmod +x ./publish.sh
$ ./publish.sh
```
