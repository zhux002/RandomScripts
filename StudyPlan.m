function [wordlist_final] = StudyPlan ()

intervaljump = [1,2,4,7,15];

wordlist = zeros(60,20);
wordlist (:,1) = 1:60; 

for i = 1:10
    
    for j = intervaljump
        
        k = i + j; 
        
        [x,y] = find(wordlist(k,:));
        
        z = max(y);
        
        wordlist(k,z+1) = strcat(i);
        
    end
end

for l = 1:24
     
    [x,y] = find(wordlist(l,:));
    
    z = max(y);
    
    wordlist_final_temp_new = {};
    wordlist_final_temp = {};
    
    for m = 1:z
        wordlist_final_temp_new = mat2cell([wordlist(l,m)*3-2,wordlist(l,m)*3-1,wordlist(l,m)*3],1,3);
        wordlist_final_temp = [wordlist_final_temp,wordlist_final_temp_new];
    end
    
    wordlist_final(l).lists = wordlist_final_temp;
end
    
end



