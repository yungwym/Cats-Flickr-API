//
//  Photo.h
//  Cats-Flickr API
//
//  Created by Alex Wymer  on 2017-07-17.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic) NSString *photoID;
@property (nonatomic) NSString *photoOwner;
@property (nonatomic) NSString *photoSecret;
@property (nonatomic) NSString *photoServer;
@property (nonatomic) NSString *photoFarm;
@property (nonatomic) NSString *photoTitle;
@property (nonatomic) NSString *imageURL; 


- (instancetype)initWithID:(NSString *)photoID andOwner:(NSString *)photoOwner andSecret:(NSString *)photoSecret andServer:(NSString *)photoServer andFarm:(NSString *)photoFarm andTitle:(NSString *)photoTitle; 

@end
