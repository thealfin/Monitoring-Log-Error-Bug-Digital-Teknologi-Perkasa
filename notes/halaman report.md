ini adalah komponen page report dari react
import React from 'react';
import { MOCK_LOGS } from '../services/mockData';
import { PieChart, Pie, Cell, ResponsiveContainer, Tooltip, Legend, BarChart, Bar, XAxis, YAxis, CartesianGrid } from 'recharts';

const COLORS = ['#F97316', '#3B82F6', '#10B981', '#EF4444']; // Orange, Blue, Green, Red for Todo, InProgress, Done, Rejected

export const Reports: React.FC = () => {
  const statusData = [
    { name: 'To Do', value: MOCK_LOGS.filter(l => l.status === 'todo').length },
    { name: 'In Progress', value: MOCK_LOGS.filter(l => l.status === 'in_progress').length },
    { name: 'Done', value: MOCK_LOGS.filter(l => l.status === 'done').length },
    { name: 'Rejected', value: MOCK_LOGS.filter(l => l.status === 'rejected').length },
  ].filter(d => d.value > 0);

  // Group by Module
  const moduleCount: Record<string, number> = {};
  MOCK_LOGS.forEach(log => {
    moduleCount[log.module] = (moduleCount[log.module] || 0) + 1;
  });
  const moduleData = Object.keys(moduleCount).map(key => ({ name: key, value: moduleCount[key] }));

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Reports</h1>
        <p className="text-sm text-gray-500 mt-1">Deep dive into bug statistics and trends.</p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        
        {/* Status Distribution */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-100 p-6">
          <h3 className="text-lg font-bold text-gray-900 mb-4">Status Breakdown</h3>
          <div className="h-72">
            <ResponsiveContainer width="100%" height="100%">
              <PieChart>
                <Pie
                  data={statusData}
                  cx="50%"
                  cy="50%"
                  innerRadius={60}
                  outerRadius={100}
                  fill="#8884d8"
                  paddingAngle={5}
                  dataKey="value"
                >
                  {statusData.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                  ))}
                </Pie>
                <Tooltip />
                <Legend verticalAlign="bottom" height={36} />
              </PieChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* Module Distribution */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-100 p-6">
          <h3 className="text-lg font-bold text-gray-900 mb-4">Issues by Module</h3>
          <div className="h-72">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart layout="vertical" data={moduleData}>
                <CartesianGrid strokeDasharray="3 3" horizontal={true} vertical={false} />
                <XAxis type="number" tick={{fontSize: 12}} />
                <YAxis dataKey="name" type="category" width={100} tick={{fontSize: 11}} />
                <Tooltip cursor={{fill: 'transparent'}} />
                <Bar dataKey="value" fill="#64748B" radius={[0, 4, 4, 0]} barSize={20} />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>
      </div>
    </div>
  );
};