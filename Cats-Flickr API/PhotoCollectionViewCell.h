//
//  PhotoCollectionViewCell.h
//  Cats-Flickr API
//
//  Created by Alex Wymer  on 2017-07-17.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface PhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic) Photo *photo;

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *photoLabel;

@end
