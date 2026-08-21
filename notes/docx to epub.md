# Troubleshooting: Word (.docx) to EPUB 2 Conversion for KOReader

## 🎯 Goal

Convert a study material file (`mfd.docx` / NISM PDF) into a cleanly formatted **EPUB 2** ebook optimized specifically for the **[[KOReader]]** engine on a Amazon Kindle.

---

## 🛠️ The Standard Working Command
When the file structural integrity is correct, use **Pandoc** to output native EPUB 2:

```bash
pandoc input.docx -t epub2 -o output.epub
```

### Adding a Custom Cover
```bash
pandoc input.docx -t epub2 --epub-cover-image=cover.jpg -o output.epub
```

---