# Run this script the night before the workshop to verify your Python environment.
# Usage: python check_setup.py

import sys
import importlib

packages = {
    "pandas": "pandas",
    "numpy": "numpy",
    "matplotlib": "matplotlib",
    "seaborn": "seaborn",
    "lifelines": "lifelines",
    "statannotations": "statannotations",
    "scipy": "scipy",
    "tableone": "tableone",
    "scikit-learn": "sklearn",
    "statsmodels": "statsmodels",
    "joypy": "joypy",
}

print(f"Python version: {sys.version}\n")

failed = []
for display_name, import_name in packages.items():
    try:
        mod = importlib.import_module(import_name)
        ver = getattr(mod, "__version__", "unknown")
        print(f"  {display_name:<20} {ver:<12}  OK")
    except ImportError:
        print(f"  {display_name:<20} {'NOT INSTALLED':<12}  MISSING")
        failed.append(display_name)

print()
if not failed:
    print("All packages found. You are ready for the workshop.")
else:
    print(f"Missing packages: {', '.join(failed)}")
    print("Run:  pip install -r requirements.txt  to install them.")
    sys.exit(1)
