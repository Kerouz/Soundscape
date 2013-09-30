//
//  SCDetailViewController.m
//  Soundscape
//
//  Created by Apple on 14/09/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "SCDetailViewController.h"

@interface SCDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;


@end

NSMutableArray *soundsArray;


@implementation SCDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentPaused = NO;
    soundsArray = [NSMutableArray new];
    
    
    
        NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"Brightside" ofType:@"mp3"];
        _audioPlayerLoop = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:soundFile] error:nil];
        [soundsArray addObject:_audioPlayerLoop];
        [_audioPlayerLoop prepareToPlay];
    

    
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"wolves_timber_wolves_howling"
                                         ofType:@"mp3"]];
    
    NSError *error;
    _audioPlayer = [[AVAudioPlayer alloc]
                    initWithContentsOfURL:url
                    error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        _audioPlayer.delegate = self;
        [soundsArray addObject:_audioPlayer];
        [_audioPlayer prepareToPlay];
    }

    [self configureView];
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
}

- (void) audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    
}

- (void) audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    
}

- (void) audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)playSound:(id)sender
{
    //_audioPlayer.numberOfLoops = -1;
    [_audioPlayer play];
    
}

- (IBAction)playLoop1:(id)sender
{
    _audioPlayerLoop.numberOfLoops = -1;
    [_audioPlayerLoop play];
    
}



- (IBAction)stopAll:(id)sender {
    
    for (AVAudioPlayer *a in soundsArray) {
        [a stop];
//        NSTimeInterval startTime = 0;
//        [a setCurrentTime:startTime];
        [a setCurrentTime:0];
    }
//    [_audioPlayer stop];
}

- (IBAction)pauseAll:(id)sender {
    if (!currentPaused) {
        for (AVAudioPlayer *a in soundsArray) [a pause];
        currentPaused = YES;
    } else {
        for (AVAudioPlayer *a in soundsArray) [a play];
        currentPaused = NO;
    }
}


- (IBAction)volumeSound:(UISlider *)sender
{
    if (_audioPlayer != nil)
    {
        _audioPlayer.volume = _volumeControl.value;
    }

}

- (IBAction)volumeLoop1:(UISlider *)sender
{
    if (_audioPlayerLoop != nil)
    {
        _audioPlayerLoop.volume = _volumeLoopControl.value;
    }
    
}



#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (IBAction)PlaySound:(id)sender {
}

- (IBAction)VolumeSound:(UISlider *)sender {
}
@end
