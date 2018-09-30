/*
 https://leetcode.com/problems/number-of-boomerangs/description/
 Given n points in the plane that are all pairwise distinct, a "boomerang" is a tuple of points (i, j, k) such that the distance between i and j equals the distance between i and k (the order of the tuple matters).
 
 Find the number of boomerangs. You may assume that n will be at most 500 and coordinates of points are all in the range [-10000, 10000] (inclusive).
 
 Example:
 Input:
 [[0,0],[1,0],[2,0]]
 
 Output:
 2
 
 Explanation:
 The two boomerangs are [[1,0],[0,0],[2,0]] and [[1,0],[2,0],[0,0]]
 */

class Solution {
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        if points.count < 3 { return 0 }
        
        var paired: Int = 0
        for i in 0..<points.count {
            var distancies: [Int: Int] = [:]
            let point1 = points[i]
            var points2 = points
            points2.remove(at: i)
            for j in 0..<points2.count {
                
                let point2 = points2[j]
                
                let width = point1[0] - point2[0]
                let height = point1[1] - point2[1]
                
                let distance = width*width + height*height
                
                let contains = distancies[distance] ?? 0
                
                // paired
                // i and j have same distance with others
                paired += 2 * contains
                
                distancies[distance] = contains + 1
            }
        }
        return paired
    }
}
