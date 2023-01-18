# Description

YouPlot is a command line tool that draws plots on the terminal.

This is an Alpine based image with the installed Ruby gem `uplot`.

## Docker Usage

```
cat islands.tsv | docker run --rm -i  gitrust/youplot barplot

docker run --rm -it -v $(pwd):/home/app gitrust/youplot barplot /home/app/islands.tsv
```

For the full description visit the author's page on https://github.com/red-data-tools/YouPlot