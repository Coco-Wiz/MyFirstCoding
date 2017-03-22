//
//  ViewController.m
//  Sort
//
//  Created by 胡胡 on 2017/3/22.
//  Copyright © 2017年 胡胡. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    //OC 中常用的一些排序
    NSArray *arr = @[@"1",@"2",@"5",@"3",@"6",@"9",@"5",];
    
    NSMutableArray *oldArr = [NSMutableArray arrayWithArray:arr];
    
    NSLog(@"原始的数组: %@",oldArr);
    
    [self bubbleSort:oldArr];
    
    [self selectionSort:oldArr];
    
    [self insertSor:oldArr];
    
    [self quickSort:oldArr leftIndex:1 rightIndex:5];
}


#pragma mark - bubbleSort
/**
 ①.冒泡排序算法
 @param array 参数
 */
- (void)bubbleSort:(NSMutableArray *)array {
    
    for (int i = 0; i < array.count; i++) {
        
        for (int j = 0; j < array.count-i-1; j++) {
            
            if ([array[j+1]integerValue] < [array[j]integerValue]) {
                
                int temp = [array[j] integerValue];
                
                array[j] = array[j+1];
                
                array[j+1] = [NSNumber numberWithInt:temp];
            }
        }
    }
    
    NSLog(@"冒泡排序后: %@",array);
    
}

#pragma mark - selectionSort
/**
 ②.选择排序
 @param array 参数
 */
- (void)selectionSort:(NSMutableArray *)array {
    
    for (int i = 0; i < array.count; i++) {
        
        for (int j = i+1; j <array.count ; j++) {
            
            if ([array[i]integerValue] > [array[j]integerValue]) {
                
                int temp = [array[i] integerValue];
                
                array[i] = array[j];
                
                array[j] = [NSNumber numberWithInt:temp];
                
            }
        }
    }
    
    NSLog(@"选择排序后: %@",array);
    
}

#pragma mark - insertSort
/**
 ③.插入排序
 @param array 参数
 */
- (void)insertSor:(NSMutableArray *)array {
    
    for (int i = 1; i < array.count; i++) {
        
        int temp = [array[i]integerValue];
        
        for (int j = i-1; j>=0 && temp <[array[j] integerValue]; j--) {
            
            array[j+1] = array[j];
            
            array[j] = [NSNumber numberWithInt:temp];
            
        }
    }
    
    NSLog(@"插入排序后: %@",array);
    
}

#pragma mark - quickSort
/**
 ④.快速排序
 @param array 参数
 */
- (void)quickSort:(NSMutableArray *)array leftIndex:(int)left rightIndex:(int)right {
    
    if (left < right) {
        
        int temp = [self getMiddleIndex:array leftIndex:left rightIndex:right];
        
        [self quickSort:array leftIndex:left rightIndex:temp-1];
        
        [self quickSort:array leftIndex:temp+1 rightIndex:right];
        
    }
    NSLog(@"快速排序后: %@",array);
}

- (int)getMiddleIndex:(NSMutableArray *)array leftIndex:(int)left rightIndex:(int)right {
    
    int tempValue = [array[left] integerValue];
    
    while (left < right) {
        
        while (left < right && tempValue <= [array[right] integerValue]) {
            
            right--;
        }
        
        if (left < right) {
            
            array[left]=array[right];
        }
        
        while (left < right && [array[left] integerValue] <= tempValue) {
            
            left++;
        }
        if (left < right) {
            
            array[left] = array[right];
        }
    }
    
    array[left] = [NSNumber numberWithInt:tempValue];
    
    return left;
    
}
@end
