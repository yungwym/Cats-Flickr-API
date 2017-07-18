//
//  Photo.m
//  Cats-Flickr API
//
//  Created by Alex Wymer  on 2017-07-17.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithID:(NSString *)photoID andOwner:(NSString *)photoOwner andSecret:(NSString *)photoSecret andServer:(NSString *)photoServer andFarm:(NSString *)photoFarm andTitle:(NSString *)photoTitle
{
    self = [super init];
    if (self) {
 
        _photoID = photoID;
        _photoOwner = photoOwner;
        _photoSecret = photoSecret;
        _photoServer = photoServer;
        _photoFarm = photoFarm;
        _photoTitle = photoTitle;
        _imageURL = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg", _photoFarm, _photoServer, _photoID, _photoSecret];
        
    }
    return self;
}

@end
