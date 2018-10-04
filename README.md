# Syllabus

Experimenting with using GitHub to generate a syllabus and a summary page from RMarkdown documents.

- This work is based on what's in <https://github.com/merely-useful/still-magic>:
- Lessons/chapters are in the sub-directory `_en` (short for "English").
- This becomes a collection in Jekyll thanks to the `collections` and `defaults` fields in `_config.yml`.
- Each lesson file `_en/something.md` lists its lesson objectives under the `objectives` key in its YAML header.
- The order of lessons is specified by the `toc` field in `_config.yml`.
- When a lesson is compiled by Jekyll, its objectives are listed in a `div` in the generated HTML page.
  - This is done inline in `_layouts/default.html` in this repository, but in an included file in the `still-magic` repo.
- In addition, all the objectives from all the lessons are collected together in `_en/objectives.md`.
  - Again, `still-magic` uses an included file to do this.
- Note that both of the above are implemented using a double loop because Jekyll doesn't support lookup-by-key for collections.
- I would like to reproduce these capabilities (in-lesson listing of objectives and summary of all objectives) in RMarkdown.
- I can get the in-lesson listing like this:

        ---
        title: "Simple Language Demos"
        output: html_document
        params:
          objectives:
            - alpha
            - beta
        ---
        
        ```{r, results="asis"}
        cat(paste("- ", params$objectives), sep = "\n")
        ```

- However, RMarkdown doesn't collect metadata from multiple files in one place that users like me can get at.
- So Yihui suggested generating GFM from RMarkdown and using Jekyll to implement both loops.
- I therefore think I need to convert `./*.Rmd` into `_en/*.md`, **preserving the YAML headers**, and commit those `.md` files.
- GitHub will then do the rest.
- Once this is working, I can put learners' questions and lesson keypoints into the metadata as well and then tackle glossary entries.
