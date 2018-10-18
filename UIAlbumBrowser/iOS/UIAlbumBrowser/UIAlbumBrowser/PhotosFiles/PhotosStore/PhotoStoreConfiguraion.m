/**
 * APICloud Modules
 * Copyright (c) 2014-2018 by APICloud, Inc. All Rights Reserved.
 * Licensed under the terms of the The MIT License (MIT).
 * Please see the license.html included with this distribution for details.
 */

#import "PhotoStoreConfiguraion.h"
#import "AlbumBrowserSinglen.h"

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
NSString * ConfigurationCameraRoll = @"Camera Roll";
NSString * ConfigurationAllPhotos = @"All Photos";
NSString * ConfigurationHidden = @"Hidden";
NSString * ConfigurationSlo_mo = @"Slo-mo";
NSString * ConfigurationScreenshots = @"Screenshots";
NSString * ConfigurationVideos = @"Videos";
NSString * ConfigurationPanoramas = @"Panoramas";
NSString * ConfigurationTime_lapse = @"Time-lapse";
NSString * ConfigurationRecentlyAdded = @"Recently Added";
NSString * ConfigurationRecentlyDeleted = @"Recently Deleted";
NSString * ConfigurationBursts = @"Bursts";
NSString * ConfigurationFavorite = @"Favorite";
NSString * ConfigurationSelfies = @"Selfies";


static NSArray <NSString *>*  groupNames;

@implementation PhotoStoreConfiguraion

+(void)initialize
{
    if (self == [PhotoStoreConfiguraion class])
    {
        
    }
}

-(NSArray *)groupNamesConfig
{
    
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    NSLog( @"currentLanguage%@" , currentLanguage);
    
            if ( [AlbumBrowserSinglen.sharedSingleton.openType  isEqualToString:@"image"]) {
                if([currentLanguage isEqualToString:@"en-CN"]){
                    
                  
               groupNames = @[@"All Photos",@"Camera Roll",@"Slo-mo",@"Screenshots",@"Panoramas",@"Time-lapse",@"Recently Added",@"Bursts",@"Favorites",@"Selfies",@"Live Photos"];
        
                }else{
                   groupNames = @[@"所有照片",@"相机胶卷",@"慢动作",@"屏幕快照",@"全景照片",@"定时拍照",@"最近添加",@"连拍快照",@"个人收藏",@"自拍",@"实况照片",@"延时摄影",@"Live Photo"];
                }
            }else{
    
                if([currentLanguage isEqualToString:@"en-CN"]){
                 
                 groupNames = @[@"All Photos",@"Camera Roll",@"Slo-mo",@"Screenshots",@"Videos",@"Panoramas",@"Time-lapse",@"Recently Added",@"Bursts",@"Favorites",@"Selfies",@"Live Photos"];
                }else{
                groupNames = @[@"所有照片",@"相机胶卷",@"慢动作",@"屏幕快照",@"视频",@"全景照片",@"定时拍照",@"最近添加",@"连拍快照",@"个人收藏",@"自拍",@"实况照片",@"延时摄影",@"Live Photo"];
                }
            
            }
    return groupNames;
}

-(void)setGroupNames:(NSArray<NSString *> *)newGroupNames
{
    groupNames = newGroupNames;
    
    [self localizeHandle];
}

//初始化方法
-(instancetype)initWithGroupNames:(NSArray<NSString *> *)groupNames
{
    if (self = [super init])
    {
      
        [self setGroupNames:groupNames];
              
    }
    
    return self;
}


+(instancetype)storeConfigWithGroupNames:(NSArray<NSString *> *)groupNames
{
    return [[self alloc]initWithGroupNames:groupNames];
}



/** 本地化语言处理 */
- (void)localizeHandle
{
    NSMutableArray <NSString *> * localizedHandle = [NSMutableArray arrayWithArray:groupNames];
    
    for (NSUInteger i = 0; i < localizedHandle.count; i++)
    {
        [localizedHandle replaceObjectAtIndex:i withObject:NSLocalizedString(localizedHandle[i], @"")];
    }
    
    groupNames = [NSArray arrayWithArray:localizedHandle];
}


@end




