//
//  main.m
//  HeapSort
//
//  Created by Angel Lee on 2015-07-08.
//  Copyright (c) 2015 Angel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int leftLeafIndex(int parentIndex)
{
    parentIndex = parentIndex + 1;
    return (2 * parentIndex) - 1;
}

int rightLeafIndex(int parentIndex)
{
    parentIndex = parentIndex + 1;
    return (2 * parentIndex + 1) - 1;
}

int lastParentIndex(NSMutableArray *arr)
{
    return (int)arr.count / 2;
}

#pragma mark - MIN
void minHeapify(NSMutableArray *arr, int parentIndex)
{
    int smallestIndex = parentIndex;
    int leftIndex = leftLeafIndex(parentIndex);
    int rightIndex = rightLeafIndex(parentIndex);
    
    if (leftIndex < arr.count && arr[leftIndex] < arr[smallestIndex]) {
        smallestIndex = leftIndex;
    }
    
    if (rightIndex < arr.count && arr[rightIndex] < arr[smallestIndex]) {
        smallestIndex = rightIndex;
    }

    if (smallestIndex != parentIndex) {
        [arr exchangeObjectAtIndex:smallestIndex withObjectAtIndex:parentIndex];
        minHeapify(arr, smallestIndex);
    }
}

void buildMinHeap(NSMutableArray *unsorted)
{
    if (unsorted.count < 2) return;
    int index = lastParentIndex(unsorted);
    
    for (int i = index; i>=0; i--) {
        minHeapify(unsorted, i);
    }
}

// Heapsort with min heap
NSMutableArray *minHeapSort(NSMutableArray *unsorted) {
    
    if (unsorted.count < 2) return unsorted;
    buildMinHeap(unsorted);
    NSMutableArray *sorted = [NSMutableArray array];
    
    for (int i=(int)unsorted.count-1; i>0; i--) {
        [sorted addObject:unsorted[0]];
        [unsorted exchangeObjectAtIndex:0 withObjectAtIndex:unsorted.count-1];
        [unsorted removeLastObject];
        minHeapify(unsorted, 0);
    }
    [sorted addObject:[unsorted lastObject]];
    return sorted;
}

#pragma mark - MAX
void maxHeapify(NSMutableArray *arr, int parentIndex)
{
    int largestIndex = parentIndex;
    int leftIndex = leftLeafIndex(parentIndex);
    int rightIndex = rightLeafIndex(parentIndex);
    
    if (leftIndex < arr.count && arr[leftIndex] > arr[largestIndex]) {
        largestIndex = leftIndex;
    }
    
    if (rightIndex < arr.count && arr[rightIndex] > arr[largestIndex]) {
        largestIndex = rightIndex;
    }
    
    if (largestIndex != parentIndex) {
        [arr exchangeObjectAtIndex:parentIndex withObjectAtIndex:largestIndex];
        maxHeapify(arr, largestIndex);
    }
}

void buildMaxHeap(NSMutableArray *unsorted)
{
    if (unsorted.count < 2) return;
    int index = lastParentIndex(unsorted);
    
    for (int i=index; i >=0; i--) {
        maxHeapify(unsorted, i);
    }
}

// Heapsort with max heap
NSMutableArray *maxHeapSort(NSMutableArray *unsorted) {
    
    if (unsorted.count < 2) return unsorted;
    buildMaxHeap(unsorted);
    NSMutableArray *sorted = [NSMutableArray array];
    
    for (int i=(int)unsorted.count-1; i>0; i--) {
        [sorted insertObject:unsorted[0] atIndex:0];
        [unsorted exchangeObjectAtIndex:0 withObjectAtIndex:unsorted.count-1];
        [unsorted removeLastObject];
        maxHeapify(unsorted, 0);
    }
    [sorted insertObject:unsorted[0] atIndex:0];
    return sorted;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSMutableArray *a =  [@[@4,@1,@3,@2,@16,@9,@10,@14,@8,@7] mutableCopy];
        a = minHeapSort(a);
        
        
    }
    return 0;
}
