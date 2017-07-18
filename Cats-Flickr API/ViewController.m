//
//  ViewController.m
//  Cats-Flickr API
//
//  Created by Alex Wymer  on 2017-07-17.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"
#import "PhotoCollectionViewCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic) NSMutableArray <Photo*> *photoArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.photoArray = [NSMutableArray new];
    
    [self getCars];
}

-(void)getCars {
    
    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=871afbca29a7abc2ee5d87d76bfb681f&tags=surf"];
    
    NSURLRequest *carRequest = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:carRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) {
            
            NSLog(@"Error: %@", error.localizedDescription);
            abort();
        }
        
        NSError *jSONError = nil;
        NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&jSONError];
        
        if (jSONError) {
            NSLog(@"Error parsing JSON: %@", jSONError);
            abort();
        }
        
        NSDictionary *dict = [info valueForKeyPath:@"photos.photo"];
        NSMutableArray *tmpCarArray = [NSMutableArray new];
        
        for (NSDictionary *apiDict in dict) {
            
            Photo *photo = [[Photo alloc] initWithID:apiDict[@"id"] andOwner:apiDict[@"owner"] andSecret:apiDict[@"secret"] andServer:apiDict[@"server"] andFarm:apiDict[@"farm"] andTitle:apiDict[@"title"]];
            
            [tmpCarArray addObject:photo];
        }
        
        self.photoArray = [NSMutableArray arrayWithArray:tmpCarArray];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
        [self.collectionView reloadData]; 
        }];
        
    }];
    
    [dataTask resume];
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
   return self.photoArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    Photo *photo = self.photoArray[indexPath.row];
    
    cell.photoLabel.text = photo.photoTitle;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photo.imageURL]]];
    
    cell.photoImageView.image = image;
    
    return cell;
    
}




@end
