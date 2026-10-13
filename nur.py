import sys
import json
import os
import subprocess

def anza():
    if os.path.exists("nuru.json"):
        print("⚠️ nuru.json tayari ipo (already exists!)")
        return
    
    print("🚀 nuru inaanza...")
    os.makedirs("chanzo", exist_ok=True)
    os.makedirs("vipimo", exist_ok=True)
    os.makedirs("vifurushi", exist_ok=True)

    config = {
        "name": "mradi_wangu",
        "version": "1.0.0",
        "dependencies": {
            "nuru_std": "https://github.com/abbashusain619/nuru-std.git"
        }
    }
    with open("nuru.json", "w") as f:
        json.dump(config, f, indent=4)

    with open("chanzo/main.nr", "w") as f:
        f.write('andika("Mambo Dunia! Natumia NURU PROGRAMMING!")\n')

    with open(".gitignore", "w") as f:
        f.write("vifurushi/\n")
    
    print("✅ Scaffold complete! Run 'nur vuta' to fetch packages.")

def vuta():
    if not os.path.exists("nuru.json"):
        print("❌ nuru.json haipatikani! (Run 'nur anza' first)")
        return
        
    with open("nuru.json", "r") as f:
        config = json.load(f)
        
    dependencies = config.get("dependencies", {})
    if not dependencies:
        print("⚠️ Hakuna vifurushi vya kuvuta. (No dependencies to fetch)")
        return
        
    print("🔄 Inavuta vifurushi... (Fetching packages...)")
    os.makedirs("vifurushi", exist_ok=True)
    
    for pkg_name, repo_url in dependencies.items():
        target_dir = os.path.join("vifurushi", pkg_name)
        if os.path.exists(target_dir):
            print(f"⚡ {pkg_name} tayari ipo. Inasasisha... (Updating {pkg_name}...)")
            subprocess.run(["git", "-C", target_dir, "pull", "-q"])
        else:
            print(f"📦 Inapakua {pkg_name} kutoka {repo_url}...")
            subprocess.run(["git", "clone", "-q", repo_url, target_dir])
            
    print("✅ Vifurushi vyote vimevutwa! (All packages fetched and ready!)")

def endesha():
    # Assuming 'nuru' is the global command for the interpreter
    entry_file = "chanzo/main.nr"
    
    if not os.path.exists(entry_file):
        print(f"❌ Kosa: Faili la {entry_file} halijapatikana! (Entry file not found)")
        return
        
    print(f"▶️ Inaendesha {entry_file}...\n" + "-"*30)
    
    try:
        # Calls the actual nuru interpreter on the user's machine
        subprocess.run(["nuru", entry_file])
    except FileNotFoundError:
        print("❌ Kosa: 'nuru' interpreter haijapatikana kwenye mfumo wako. (Nuru is not installed/in PATH)")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("🛠️  Matumizi (Usage): nur <command>")
        print("   anza    -> Create a new nuru project")
        print("   vuta    -> Fetch and install dependencies")
        print("   endesha -> Run the project (chanzo/main.nr)")
        sys.exit(1)

    command = sys.argv[1]

    if command == "anza":
        anza()
    elif command == "vuta":
        vuta()
    elif command == "endesha":
        endesha()
    else:
        print(f"❌ command haijulikani: {command}")