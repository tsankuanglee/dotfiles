from typing import List
import datetime
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
    if w is not None:
        date_str = datetime.datetime.now().strftime("%Y%m%d")
        w.paste_text(date_str)
