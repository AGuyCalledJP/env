#!/usr/bin/python3

import iterm2 

async def main(connection):
    app = await iterm2.async_get_app(connection)

    await app.async_activate()

    await iterm2.Window.async_create(
        connection, 
        profile="ps-code-no-mux"
    )

iterm2.run_until_complete(main, True)
