# terraform-github-repo

[![Terraform Registry](https://img.shields.io/badge/Terraform%20Registry-Published-blue?logo=terraform)](https://registry.terraform.io/modules/YOUR_ORG/github-repo/github)
[![CI](https://github.com/your-org/github-repo-module/actions/workflows/test.yml/badge.svg)](https://github.com/your-org/github-repo-module/actions/workflows/test.yml)
[![Release](https://img.shields.io/badge/release-automated-blue.svg?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

[![Terraform Registry](https://img.shields.io/badge/Terraform%20Registry-Published-blue?logo=terraform)](https://registry.terraform.io/modules/YOUR_ORG/github-repo/github)
[![CI](https://github.com/your-org/github-repo-module/actions/workflows/test.yml/badge.svg)](https://github.com/your-org/github-repo-module/actions/workflows/test.yml)
[![Release](https://img.shields.io/badge/release-automated-blue.svg?logo=semantic-release)](https://github.com/semantic-release/semantic-release)
[![Test Coverage](https://github.com/your-org/github-repo-module/actions/workflows/test.yml/badge.svg?event=push)](https://github.com/your-org/github-repo-module/actions/workflows/test.yml)

A reusable module for enforcing GitHub repository best practices via Terraform.

## Usage

```hcl
module "repo" {
  source  = "your-org/github-repo/github"
  version = "1.0.0"

  name                     = "my-repo"
  owners                   = ["my-org/team"]
  enforce_gitflow          = true
  enforce_security         = true
  enforce_tests            = true
  enforce_docs             = true
  enforce_issue_integration = true
  bootstrap_with_templates = true
}
```

---

## 📚 Features

- ✅ GitFlow branch naming and protection
- ✅ CodeQL & Dependabot security automation
- ✅ PR-to-Issue linking enforcement
- ✅ Test presence enforcement on PRs
- ✅ Modular toggles for enforcement rules
- ✅ Bootstrap standard docs (README, LICENSE, SECURITY.md)
- ✅ Automated releases & changelogs

---

## 📦 Alternative Install (non-registry)

```hcl
module "repo" {
  source = "git::https://github.com/your-org/github-repo-module.git//modules/github-repo?ref=v1.0.0"

  name                     = "my-repo"
  owner                    = "your-org"
  visibility               = "private"

  enforce_gitflow          = true
  enforce_tests            = true
  enforce_security         = true
  enforce_docs             = true
  bootstrap_with_templates = true
}
```

---

## 🔧 Inputs

<!-- BEGIN_TF_DOCS:inputs -->
<!-- END_TF_DOCS:inputs -->
|------|-------------|------|---------|
| `name` | Repository name | `string` | — |
| `owner` | GitHub user/org | `string` | — |
| `visibility` | `private` or `public` | `string` | `"private"` |
| `enforce_gitflow` | Enforce branch naming + protection | `bool` | `false` |
| `enforce_tests` | Require test changes in PRs | `bool` | `false` |
| `enforce_security` | Enable CodeQL + Dependabot | `bool` | `false` |
| `enforce_docs` | Require docs updates | `bool` | `false` |
| `bootstrap_with_templates` | Add default files | `bool` | `true` |
| `enforce_issue_integration` | Require PRs to reference issues | `bool` | `false` |
| `enforce_project_board` | Enable project linking | `bool` | `false` |
| `traceability_enabled` | Enforce requirements traceability | `bool` | `false` |
| `enable_weekly_reporting` | Adds scorecard, stale bot, etc. | `bool` | `false` |

---

## 📤 Outputs

<!-- BEGIN_TF_DOCS:outputs -->
<!-- END_TF_DOCS:outputs -->
|------|-------------|
| `repository_name` | The name of the created repository |
| `repository_full_name` | Full name including org/user |
| `repository_url` | Repository HTTPS URL |

---

## 🧪 Testing

### Run Terratest locally

```bash
task test
```

Tests live in `test/` and use fixtures from `test/fixtures/`.

> Requires `GITHUB_TOKEN` to be set in your `.env` or terminal.

---

## 💡 Contributing

### 1. Setup

```bash
npm install        # Installs Husky + commitlint
task husky         # (optional) sets up hooks manually
```

### 2. Commit Convention

Commits must follow [Conventional Commits](https://www.conventionalcommits.org/):

Examples:

```bash
git commit -m "feat: add issue reference enforcement"
git commit -m "fix: correct visibility output name"
```

Husky will block non-conforming messages.

---

## 🚀 Automated Releases

Merges into `main` trigger:

- Changelog updates (`CHANGELOG.md`)
- Git tag bumps (e.g. `v1.2.0`)
- GitHub Releases

Powered by [semantic-release](https://github.com/semantic-release/semantic-release).

---

## 📜 License

[MIT](LICENSE)
