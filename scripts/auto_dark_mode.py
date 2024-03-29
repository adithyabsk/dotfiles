#!/usr/bin/env python3

"""
To make sure this works:
iTerm2 > General > Magic > "Enable Python API" > Allow all apps to connect

Then confirm that you ran the config.py script.

"""
# Inspired by
# https://gist.github.com/jamesmacfie/2061023e5365e8b6bfbbc20792ac90f8#gistcomment-3785910
# Scripts > Manage > Console
import asyncio
import iterm2
from pathlib import Path


# TODO: look into setting up iTerm2 shell integration
# https://iterm2.com/documentation-shell-integration.html

# Tokyonight Theme Installation
# https://github.com/folke/tokyonight.nvim/tree/main/extras/iterm
THEME_LIGHT = "Light Background"
THEME_DARK = "tokyonight_night"


class AutoSwtichTheme:
    def __init__(self, connection, light="Light Background", dark="Dark Background"):
        self.connection = connection
        self.light = light
        self.dark = dark

    async def get_app(self):
        return await iterm2.async_get_app(self.connection)

    async def get_theme(self) -> str:
        parts = await (await self.get_app()).async_get_theme()
        if len(parts) <= 1:
            return parts[0]
        return ""

    async def set_color_preset(self, theme):
        # update iTerm theme
        preset = await iterm2.ColorPreset.async_get(
            self.connection, self.light if theme == "light" else self.dark
        )
        profiles = await iterm2.PartialProfile.async_query(self.connection)
        for partial in profiles:
            await (await partial.async_get_full_profile()).async_set_color_preset(
                preset
            )


async def quit(connection):
    while True:
        if not connection.websocket.open:
            exit(0)
        await asyncio.sleep(1)


async def main(connection):
    asyncio.ensure_future(quit(connection), loop=asyncio.get_event_loop())

    ast = AutoSwtichTheme(connection, THEME_LIGHT, THEME_DARK)
    await ast.set_color_preset(await ast.get_theme())

    async with iterm2.VariableMonitor(
        connection, iterm2.VariableScopes.APP, "effectiveTheme", None
    ) as mon:
        while True:
            # Block until theme changes
            theme = await mon.async_get()

            # Set preset if theme has changed
            await ast.set_color_preset(theme)


try:
    iterm2.run_forever(main)
except:
    print("Unable to connect on iTerm2 application")
