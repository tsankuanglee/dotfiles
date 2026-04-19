local ls = require("luasnip")

local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
-- local i = ls.insert_node

return {
  s("#!", { t("#!/usr/bin/env python") }),
  s("imports_common", {
    t({
      "import csv",
      "import datetime",
      "import glob",
      "import os",
      "import re",
      "import pandas as pd",
      "import numpy as np",
      "import matplotlib.pyplot as plt",
      "",
    }),
  }),
  s(
    "plt subplots",
    {
      t({
        "import matplotlib.pyplot as plt",
        "",
        "fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2)",
        "# ax2=r1c1; ax2=r1c2; ax3=r2c1; ax4=r2c2",
        "fig.suptitle('Sharing x per column, y per row')",
        "ax1.plot(x, y)",
        "ax2.plot(x, y**2, 'tab:orange')",
        "ax3.plot(x, -y, 'tab:green')",
        "ax4.plot(x, -y**2, 'tab:red')",
        "",
        "for ax in fig.get_axes():",
        "    ax.label_outer()",
        "",
      }),
    }
  ),
}
