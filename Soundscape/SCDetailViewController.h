//
//  SCDetailViewController.h
//  Soundscape
//
//  Created by Apple on 14/09/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SCDetailViewController : UIViewController <UISplitViewControllerDelegate, AVAudioPlayerDelegate>
{
    BOOL currentPaused;
}

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) AVAudioPlayer *audioPlayerLoop;

@property (strong, nonatomic) IBOutlet UISlider *volumeControl;
@property (strong, nonatomic) IBOutlet UISlider *volumeLoopControl;

- (IBAction)playSound:(id)sender;
- (IBAction)stopAll:(id)sender;
- (IBAction)pauseAll:(id)sender;
- (IBAction)volumeSound:(UISlider *)sender;
- (IBAction)playLoop1:(id)sender;
- (IBAction)volumeLoop1:(UISlider *)sender;


@end
