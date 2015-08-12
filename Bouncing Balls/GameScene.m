//
//  GameScene.m
//  Bouncing Balls
//
//  Created by omar lahlou on 8/6/15.
//  Copyright (c) 2015 omar lahlou. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene


-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    
    
    myLabel.text = @"Rails School <3!";
    myLabel.fontSize = 45;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   self.size.height * 0.9);
    
    [self addChild:myLabel];
    
    SKNode *edge = [SKNode node];
    
    edge.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    [self addChild:edge];

    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {

        CGPoint location = [touch locationInNode:self];

        NSArray *balls = [NSArray arrayWithObjects: @"8Ball", @"BeachBall", @"SoccerBall", nil];
        NSInteger randomIndex = arc4random_uniform(balls.count);
        
        NSLog(@"%f", location.x);
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed: balls[randomIndex]];
        
        sprite.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius: sprite.size.width*0.5];
        sprite.physicsBody.restitution = 0.5;
        
        sprite.position = location;
        
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
