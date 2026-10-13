# 📦 Nuru Package Manager (`nur`)

A lightweight, cross-platform package manager and project scaffolder for the [Nuru](https://github.com/NuruProgramming) programming language.

---

## 🚀 Installation

### Linux & macOS (Bash, Zsh, Fish)

Run the following command in your terminal:

```bash
curl -sSL https://raw.githubusercontent.com/abbashusain619/nur-cli/main/install.sh | bash
```

### Windows (PowerShell)

Run the following command in PowerShell:

```powershell
irm https://raw.githubusercontent.com/abbashusain619/nur-cli/main/install.ps1 | iex
```

> **Note:** After installation, restart your terminal or source your shell configuration to ensure `nur` is available in your `PATH`.

---

## 🛠️ Usage & Commands

Once installed, use the `nur` CLI to manage your Nuru projects:

### 1. `nur anza` (Initialize Project)
Initializes a new Nuru project in the current directory.
- Scaffolds standard directory layout:
  - `chanzo/` — Source code directory (creates starter `chanzo/main.nr`)
  - `vipimo/` — Tests directory
  - `vifurushi/` — Dependencies directory
- Generates `nuru.json` manifest with default dependencies.
- Generates `.gitignore` to ignore the `vifurushi/` directory.

```bash
nur anza
```

### 2. `nur vuta` (Fetch Dependencies)
Reads `nuru.json` and fetches all declared remote Git dependencies directly into your local `vifurushi/` folder. If a package already exists, it updates it using `git pull`.

```bash
nur vuta
```

### 3. `nur endesha` (Run Project)
Executes your project's main entry point (`chanzo/main.nr`) using the system's `nuru` interpreter.

```bash
nur endesha
```

---

## 📁 Project Structure

A project scaffolded by `nur` follows this standard structure:

```text
mradi_wangu/
├── chanzo/
│   └── main.nr       # Main entry point for execution
├── vifurushi/        # Managed dependencies (git-ignored)
│   └── nuru_std/
├── vipimo/           # Test suites
├── .gitignore        # Ignores vifurushi/
└── nuru.json         # Project manifest & dependencies
```

---

## ⚙️ Configuration (`nuru.json`)

Dependencies are defined in `nuru.json` as key-value pairs where the key is the package name and the value is the Git repository URL:

```json
{
    "name": "mradi_wangu",
    "version": "1.0.0",
    "dependencies": {
        "nuru_std": "https://github.com/abbashusain619/nuru-std.git"
    }
}
```

---

## 📋 Prerequisites

- **[Git](https://git-scm.com/)**: Required for fetching and updating dependencies (`nur vuta`).
- **[Nuru Interpreter](https://github.com/NuruProgramming)**: Required for executing code (`nur endesha`).

---

## 💻 Building from Source

To run or build `nur` locally:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/abbashusain619/nur-cli.git
   cd nur-cli
   ```

2. **Run directly with Python:**
   ```bash
   python3 nur.py anza
   python3 nur.py vuta
   python3 nur.py endesha
   ```

3. **Build standalone binary (via PyInstaller):**
   ```bash
   pip install pyinstaller
   pyinstaller --onefile nur.py
   ```
   The compiled executable will be generated in `dist/`.

---

## 📄 License

This project is open-source. Contributions are welcome!