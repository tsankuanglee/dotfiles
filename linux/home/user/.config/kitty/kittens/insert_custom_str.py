from typing import List
import datetime
import random
import uuid


from kitty.boss import Boss
from kittens.tui.handler import result_handler

def main(args: List[str]):
    pass
    # this is the main entry point of the kitten, it will be executed in
    # the overlay window when the kitten is launched
    #answer = input('Enter some text: ')
    # whatever this function returns will be available in the
    # handle_result() function
    #return answer


@result_handler(no_ui=True)
def handle_result(args: List[str], answer: str, target_window_id: int, boss: Boss) -> None:
    # get the kitty window into which to paste answer

    w = boss.window_id_map.get(target_window_id)

    if not w:
        return
    if args[1] == 'date':
        custom_str = datetime.datetime.now().strftime("%Y%m%d")
    elif args[1] == 'time':
        custom_str = datetime.datetime.now().strftime("%H%M%S")
    elif args[1] == 'datetime':
        custom_str = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    elif args[1] == 'random_uuid':
        custom_str = str(uuid.uuid4())
    elif args[1] == 'random_float':
        custom_str = str(random.random())
    else:
        return

    w.paste_text(custom_str)
