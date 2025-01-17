/*
 Copyright 2015 OpenMarket Ltd
 Copyright 2017 Vector Creations Ltd
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "RoomOutgoingTextMsgBubbleCell.h"

#import "ThemeService.h"
#import "Riot-Swift.h"
#import "MXKRoomBubbleTableViewCell+Riot.h"

@implementation RoomOutgoingTextMsgBubbleCell

- (void)customizeTableViewCellRendering
{
    [super customizeTableViewCellRendering];
    
    [self updateUserNameColor];
    
    self.messageTextView.tintColor = ThemeService.shared.theme.tintColor;
}


- (void)render:(MXKCellData *)cellData
{
    [super render:cellData];
    
    [self updateUserNameColor];
}

+ (CGFloat)heightForCellData:(MXKCellData *)cellData withMaximumWidth:(CGFloat)maxWidth
{
    RoomBubbleCellData *bubbleData = (RoomBubbleCellData*)cellData;
    
    // Include the URL preview in the height if necessary.
    if (RiotSettings.shared.roomScreenShowsURLPreviews && bubbleData && bubbleData.showURLPreview)
    {
        CGFloat height = [super heightForCellData:cellData withMaximumWidth:maxWidth];
        return height + RoomBubbleCellLayout.urlPreviewViewTopMargin + [URLPreviewView contentViewHeightFor:bubbleData.urlPreviewData];
    }
    
    return [super heightForCellData:cellData withMaximumWidth:maxWidth];
}

@end
