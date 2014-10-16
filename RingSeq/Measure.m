//
//  Measure.m
//  RingSeq
//
//  Created by Nir Boneh on 10/16/14.
//  Copyright (c) 2014 Clouby. All rights reserved.
//

#import "Measure.h"
#import "NotesHolder.h"

@implementation Measure

-(id) initWithStaff:(Staff *)staff env: (DetailViewController *) env x:(int)x withNum:(int)num{
    self = [super init];
    if(self){
        _env = env;
        _staff = staff;
        _initialNotesHolder = [[NotesHolder alloc] initWithStaff:staff env:env x:0 andTitle:[@(num) stringValue]];
        self.frame = CGRectMake(x, 0 , _initialNotesHolder.frame.size.width *4 , _initialNotesHolder.frame.size.height);
        [self addSubview:_initialNotesHolder];
        _currentSubdivision = quaters;
        [self changeSubDivision:_currentSubdivision];
        _initialNotesHolder.titleView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(handleSingleTap:)];
        [_initialNotesHolder.titleView addGestureRecognizer:singleFingerTap];
        

    }
    return self;
}

-(void)changeSubDivision:(Subdivision)subdivision{
    _currentSubdivision = subdivision;
    if(_noteHolders == nil)
        _noteHolders = [[NSMutableArray alloc] init];
    NotesHolder *notesHolder1;
    NotesHolder *notesHolder2;
    NotesHolder *notesHolder3;
    NSInteger size = _noteHolders.count;
    if(size > 0)
        notesHolder1  = [_noteHolders objectAtIndex:0];
    if(size > 1)
        notesHolder2  = [_noteHolders objectAtIndex:1];
    if(size > 2)
        notesHolder3 = [_noteHolders objectAtIndex:2];
    int x1;
    int x2;
    int x3;
    [notesHolder1 removeFromSuperview];
    [notesHolder2 removeFromSuperview];
    [notesHolder3 removeFromSuperview];
    CGRect frame ;
    switch(subdivision){
        case quaters:
            break;
        case sixteenths:
            x2 = self.frame.size.width/4;
            x3 = 3*self.frame.size.width/4;
            
            if(!notesHolder2){
                notesHolder2 = [[NotesHolder alloc] initWithStaff:_staff env:_env x:x2 andTitle:@"e"];
                [_noteHolders addObject:notesHolder3];
            }
            else
                notesHolder2.titleView.text = @"e";
            frame = notesHolder2.frame;
            frame.origin.x = x2;
            notesHolder2.frame = frame;
            
            if(!notesHolder3){
                notesHolder3 = [[NotesHolder alloc] initWithStaff:_staff env:_env x:x3 andTitle:@"a"];
                [_noteHolders addObject:notesHolder3];
            }
            else
                notesHolder3.titleView.text = @"a";
            frame = notesHolder3.frame;
            frame.origin.x = x3;
            notesHolder3.frame = frame;

            
            [self addSubview:notesHolder2];
            [self addSubview:notesHolder3];
            

        case eighths:
             x1 = self.frame.size.width/2;
            if(!notesHolder1){
                notesHolder1 = [[NotesHolder alloc] initWithStaff:_staff env:_env x:x1 andTitle:@"&"];
                [_noteHolders addObject:notesHolder1];
            }
            else
                notesHolder1.titleView.text = @"&";
            frame = notesHolder1.frame;
            frame.origin.x = x1;
            notesHolder1.frame = frame;
            
            [self addSubview:notesHolder1];
            
            break;

        case triplets:
            x1 = self.frame.size.width/3;
            x2 = 2 *(self.frame.size.width/3);
            if(!notesHolder1){
                notesHolder1 = [[NotesHolder alloc] initWithStaff:_staff env:_env x:x1 andTitle:@"trip"];
                [_noteHolders addObject:notesHolder1];
            }
            notesHolder1.titleView.text = @"trip";
            frame = notesHolder1.frame;
            frame.origin.x = x1;
            notesHolder1.frame = frame;
            
            if(!notesHolder2){
                notesHolder2 = [[NotesHolder alloc] initWithStaff:_staff env:_env x:x2 andTitle:@"let"];
                [_noteHolders addObject:notesHolder2];
            }
            notesHolder2.titleView.text = @"let";
            frame = notesHolder2.frame;
            frame.origin.x = x2;
            notesHolder2.frame = frame;
            
            [self addSubview:notesHolder1];
            [self addSubview:notesHolder2];
            break;
        case numOfSubdivisions:
            break;
    }
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    _currentSubdivision++;
    if(_currentSubdivision > numOfSubdivisions)
        _currentSubdivision = 0;
    [self changeSubDivision:_currentSubdivision];
}

@end
