let context = #{};

const PROGRAMMING_CASES = CasedIdentityAndValue([PascalCase, CamelCase, KebabCase, SnakeCase, TrainCase, ConstantCase]);

context += render(Archetype("org-prompts"), ANSWERS);

context += prompt("Book Title:", "project-name", #{
    help: "Book Title",
    cased_as: [
        FixedIdentityCasedValue(KebabCase),
        FixedKeyCasedValue("project-title", TitleCase),
    ],
});

context += prompt("Author:", "author_full");

context += prompt("Git URL:", "repository-url", #{
  placeholder: "https://github.com/your-name/your-project",
  defaults_with: render("https://github.com/{{ org-solution-name }}/{{ project-name}}", context),
  help: "The URL of the Git repository for this project.",
  optional: true,
});

context += prompt("Book URL:", "rendered-url", #{
  placeholder: "http://your-project.github.com",
  defaults_with: render("https://{{ org-solution-name}}.github.io/{{ project-name }}", context),
  help: "The URL of Rendered Book",
  optional: true,
});

context += prompt("Features:", "features", #{
    defaults_with: [],
    type: MultiSelect([
        "TOC",
        "Admonish",
        "MermaidJS",
    ]),
    help: "Features",
});

context += set("org-name", render("{{ org-solution-name }}", context));

render(Directory("contents"), context);
if context.features.contains("Admonish") {
    render(Directory("features/admonish"), context);
}
if context.features.contains("MermaidJS") {
    render(Directory("features/mermaidjs"), context);
}

// Export Context
context
