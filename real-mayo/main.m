//
//  main.m
//  real-mayo
//
//  Created by takamichi-yoshikawa on 4/28/13.
//  Copyright (c) 2013 adorechic. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
